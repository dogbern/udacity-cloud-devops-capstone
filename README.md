# Microservices Orchestration with Kubernetes using Jenkins CI/CD Pipeline

*Capstone project for Udacity's Cloud DevOps Nanodegree*

The goal of the project is to set up a Kubernetes cluster using AWS Elastic Kubernetes Service to deploy a docker image leveraging Jenkins CI/CD Pipeline. 

---

## Project Info
A simple python app, app.py was created using Flask that displays a web page. This simple app was created to illustrate how apps can be contanerized with docker and used as microservice with the use of kubernetes.

## Branches

master => This branch contains the latest code that is running is production. So this could be from green or blue branch
blue => This branch contains code for implementing blue/green deployment. 
green => This branch contains code for implementing blue/green deployment

## Deployment type

This project implements a solution for blue/green deployment to achieve a zero-dowmntime deployment. /CloudFormation/Udacity DevOps Capstone project.pdf shows a high-level diagram for this implementation

## Files

* **Udacity DevOps Capstone project.pdf**: Network diagram for the project
* **kops-cluster.png**: To check that we do have instances running as master and nodes.
* **jenkins-success.png**: With all the steps of the pipeline succeeding.
* **lint-step.png**: With the details of the linting step, to check both Python and Dockerfiles.
* **k8s-services**: With the result of the correct deployment of the kubernetes templates.
* **load-balancer-service**: Showing the details of the flask service created as a Load Balancer.
* **test-pmbrull-k8**: Testing the deployed application.

---

## Resources

* [Nirmata series on Kubernetes](https://www.eksworkshop.com/030_eksctl)
* [CI/CD with Jenkins, Docker and Kubernetes on AWS](https://medium.com/@Thegaijin/ci-cd-with-jenkins-docker-and-kubernetes-26932c3a1ea)

