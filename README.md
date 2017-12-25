# SampleProjectForCICD
Sample project for CICD using Spring boot, connect to Oracle database, have robot scripts inside ( test sample project), connect to oracle database


# RPM Information
- Follow WES_YUM_Server_Configuration_v1.2 document to set up the type of YUM repo needed.
- Before running the scripts, use following command to establish connection between the servers:
  - $ ssh-copy-id username@destination_ip
  - This command should be run on all the servers with their respective server ip and usernames.
- Run the respective script to upload the artifacts/packages to desired location.
- In approach 2, update the yum repo when new artifacts are pushed to it using:
  - $ createrepo --update /var/<repo_name>/
