Your task is to deploy a sample API with potentially several replicas and its database using
persistent storage. Ideally you will run the AWS Elastic Kubernetes Service as orchestrator of
the deployment while adhering to the best practices in the technology.
You must allow these resources to communicate with each other and that the API is accessible
from the outside, while the database is not. To define, install and manage your applications,
ideally you will use Helm. Official Helm Charts are allowed to achieve the ingress controller,
database or any other component.
To showcase your ability to work with modern systems you cannot generate these resources
manually, instead you should be focusing on IaC technologies like Terraform.
Your deployment should be driven by an informal user story that you will create, and which
should be included in your presentation.
Requirements
● Terraform code:
○ Create the resources necessary to deploy this infrastructure using a repository
structure that considers potential multiple environments and an organizational
approach.
● Helm charts:
○ Charts describing all cluster resource sets where applicable. Kustomize is an
open option here.
● Dockerfiles:
○ Sample Dockerfiles images implemented.
● User story:
○ A simple epic listing the tasks with which you would organize this
deployment.
○ The resources can remain on standby (git repository).
○ A bonus (not requirement) would be:
■ Running this infrastructure in AWS
■ Implementing a CI/CD system to automate deployment
■ GitOps
■ Any additional component that improves the complexity of this
exercise: DevOps/SRE practices, Monitoring, Log Management,
Alerts, etc.
