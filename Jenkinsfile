@Library('sample1') _
def JobName	= null						    // variable to get jobname  
def Sonar_project_name = null 				// varibale passed as SonarQube parameter while building the application
def robot_result_folder = null 				// variable used to store Robot Framework test results
def server = Artifactory.server 'art1'	    // Artifactory server instance declaration. 'server1' is the Server ID given to Artifactory server in Jenkins
def buildInfo = null 						// variable to store build info which is used by Artifactory
def rtMaven = Artifactory.newMavenBuild()	// creating an Artifactory Maven Build instance
def Reason = "JOB FAILED"					// variable to display the build failure reason
def VariableObject                                    // object for class A
def lock_resource_name = null 
    node{
		try
		{
			stage('Checkout'){
				Reason = "Checkout SCM stage Failed"
				checkout scm
			}
			def content = readFile './.env'    // variable to store .env file contents
			Properties docker_properties = new Properties() // creating an object for Properties class
			InputStream contents = new ByteArrayInputStream(content.getBytes()); // storing the contents
			docker_properties.load(contents) 
			contents = null
			stage('Reading Variables'){
				VariableObject = Reading_varibles()
				}
			stage('MavenBUild')
			{
				Reason = "Maven Build stage Failed"
				buildInfo = MavenBuild(rtMaven, server, docker_properties.snapshot_repo, docker_properties.release_repo, VariableObject.Sonar_project_name)
				
			}
			def jar_name = getMavenArtifacts()
			stage('Docker Deploment and RFW')
			{
				lock(VariableObject.lock_resource_name) 
				{
					Reason = RFW(docker_properties.robot_result_folder, rtMaven, server, jar_name)
					stage('Pushing Artifacts')
					{
						Reason = "Pushing Artifacts stage failed"
						if(!(VariableObject.JobName.contains('PR-')))
						{
							stage ('Artifacts Deployment'){
								Reason = PushingArtifacts(rtMaven, buildInfo, server)
							}
							stage ('Publish Docker Images'){
								Reason = PushingDockerImages(docker_properties.Docker_Reg_Name, docker_properties.om_image_name, docker_properties.cp_image_name, docker_properties.Docker_Registry_URL, docker_properties.Docker_Credentials, docker_properties.image_version, VariableObject.JobName)
							}
							stage ('Starting QA job') {
								Reason = TriggeringCDJob(VariableObject.Sonar_project_name)
							}
						}    
					}
				sh './clean_up.sh'
				}
		    }
			stage ('Build Promotions') {
				Reason = BuildPromotions(buildInfo, docker_properties.release_repo, docker_properties.snapshot_repo, server)
			}
		    stage('Reports creation') {
				Reason = SQReportsCreation(VariableObject.Sonar_project_name)
		    } 
		    stage('mail'){
				Reason = notifySuccess(env.WORKSPACE)
			}
		}
		catch(Exception e)
		{
			sh './clean_up.sh'
			currentBuild.result = "FAILURE"
			Reason = notifyFailure(Reason)
			sh 'exit 1'
		}
    }
