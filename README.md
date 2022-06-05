# Weight Tracker

## What Am I?

A simple weight tracking APP built with Flutter, Node and MongoDB.

Everything's been streamlined with docker-compose to get you going faster.

## Required

You need to make sure you have the following installed/running on your current system

* Docker
* Flutter v3

## Setup

* Clone this repo
* Run `make prepare`
* Run docker-compose up

First runs will take some time as various containers need to be downloaded, these include:

* node (v17 and 17-alpine)
* mongo
* nginx

Once done you should be able to access the UI via `http://localhost:8080`, API docs are available at `http://localhost:4002/api/docs`.
