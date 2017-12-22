# SampleProjectForCICD
Sample project for CICD using Spring boot, connect to Oracle database, have robot scripts inside ( test sample project), connect to oracle database


# RPM Information
- Follow WES_YUM_Server_Configuration_v1.2 document to set up the type of YUM repo needed.
- Run the respective script to upload the artifacts to desired location.
- Update the yum repo when new artifacts are pushed to YUM repo, using:
  - $ createrepo --update /var/<repo_name>/
