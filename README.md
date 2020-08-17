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

## OutputFiles

* **Udacity DevOps Capstone project.pdf**: Network diagram for the project
* **blue-service-webpage-v4.png**: screenshot to indicate updated app for blue service
* **blue-service-pipeline-success.png**: screenshot indicates pipeline for blue service was successful
* **html-lint-fail.png**: screenshot to indicate failure on lint stage
* **AWS-EKS-Clusters.png**: screenshot to indicate clusters names that were in created in aws.
* **Image-scan-failure.png**: screenshot to indicate failure on the aquascan image.
* **Pipeline-security-scan.png**: screenshot indicates pipeline with aquascan
* **ec2-instances.png**: screenshot to indicate ec2 instances used in the k8 cluster and the jenkins instance
* **route53-hosted-zone.png**: screenshot to indicate the dns service used 
* **green-service-pipeline-success-detail.png**: screenshot to give more info
* **green-service-webpage-v1.png**: screenshot of green service webpage for first version of app
* **green-service-pipeline-success.png**: screenshot of successful pipeline for green-service.
* **aws-loadbalancers-page.png**: aws loadbalancers used for deploying each service.

---

## Resources

* [Nirmata series on Kubernetes](https://www.eksworkshop.com/030_eksctl)
* [CI/CD with Jenkins, Docker and Kubernetes on AWS](https://medium.com/@Thegaijin/ci-cd-with-jenkins-docker-and-kubernetes-26932c3a1ea)

