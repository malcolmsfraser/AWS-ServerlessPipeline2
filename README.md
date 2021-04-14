# AWS-ServerlessPipeline2

### Pipeline Build Status
**Producer Lambda**  |<br />![Producer Build Status](https://codebuild.us-east-1.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoiL1FqVHZSWnZCQnNjeDRCakQ0Z01RanVmQk9oWm1MOU1xQk5wbGlZZStLY0RtcnJnR2p1aFNMcEtNV05CeVNMa1RwVFZackZ2N1R0eDY3YjBtZmxxdUlzPSIsIml2UGFyYW1ldGVyU3BlYyI6IjNvSmt3YXIvM1BJbFdycDkiLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=master)  
**Labeler Lambda**   |<br />![Labaler Build Status](https://codebuild.us-east-1.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoiL1FqVHZSWnZCQnNjeDRCakQ0Z01RanVmQk9oWm1MOU1xQk5wbGlZZStLY0RtcnJnR2p1aFNMcEtNV05CeVNMa1RwVFZackZ2N1R0eDY3YjBtZmxxdUlzPSIsIml2UGFyYW1ldGVyU3BlYyI6IjNvSmt3YXIvM1BJbFdycDkiLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=master)

## Introduction

This project demos how to create an infinitely scalable serverless data engineering pipeline. While this specific pipeline performs computer vision, the concepts shown can easily be extended to other tasks like natural language processing or involve the use of any other pretrained models.

The serverless pipeline listens to an S3 bucket for an image upload. Upon image upload the producer lamba function sends the name(s) of any uploaded file(s) to an SQS queue. The essentially infinite storage capacity of AWS S3 combined with the ability for AWS SQS to handle infinately large inputs is what allows this pipeline to scale from just a single upload to multiple files. Once in SQS, the labler lambda function in triggered which sends the files S3 location to AWS Rekognition which performs entity and text detection. The output response from Rekognition is then stored as a csv in the results folder of the same S3 bucket.

The included command-line tool allows you up upload a local file directly from your command-line and returns the computer vision results.

## Components

**IAM Role** that allows access to all services

**S3 bucket** which will store the target files and the results 

**Producer** lambda function that sends newly uploaded filenames to SQS

**Simple Queue Service (SQS)** queue which queues the files for processing

**Labeler** lambda function that calls AWS Rekognition on the queued files
