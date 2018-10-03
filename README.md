# scheduler

> Scheduler for sammler.io.

[![David](https://img.shields.io/david/sammler/scheduler.svg)](https://github.com/sammler/scheduler)
[![Codecov](https://img.shields.io/codecov/c/github/sammler/scheduler.svg?logo=codecov)](https://codecov.io/gh/sammler/scheduler)
[![CircleCI branch](https://img.shields.io/circleci/project/github/sammler/scheduler/master.svg)](https://circleci.com/gh/sammler/scheduler)

---

## Purpose

Service to publish scheduled message to NATS.

## Installation

## Usage

## Start required services for development

```
$ make up-deps
```

## Tear down required services for development

```
$ make down-deps
```

## Configuration

Environment variables used by the service:

| Name                  | Description                                                             | Type          | Default Value |
| ---                   | ---                                                                     | ---           | ---           |
| `LOAD_JOBS_FROM_FILE` | Indicates whether some default jobs should be loaded from files or not. | boolean       | false         |
| `JOB_FILES`           | Comma separated list of extra files to load from.                       | string        | ''            |

## Loading job seeds

- If `LOAD_JOBS_FROM_FILE` all `yml` files in `/opt/scheduler/src/config/job-seeds` will be loaded.
- (Not implemented yet) On top of that one can define additional files to be loaded by passing those in the env variable `JOB_FILES`.

## A job definition file

```yaml
jobs:
  - name: heartbeat       # The name of a job
    strategy: 'cron'      # Default strategy for this job, by default only `cron` for now.
    enabled: true         # Whether this job is enabled or not
    trace_id:             # Will be generated when the job is initiated (UUIID/v1).
    ts:                   # Will be generated when the job is runn (timestamp).
    cron:                 # All the cron related settings.
      def: "* * * * * *"  # Definition of the cron job.
    nats:
      subject: "foo"      # Nats' subject.
    payload:              # Various payload settings.
      setting1:
      setting2:
    
```

## About

### Author
**Stefan Walther**

* [twitter](http://twitter.com/waltherstefan)  
* [github.com/stefanwalther](http://github.com/stefanwalther) 
* [LinkedIn](https://www.linkedin.com/in/stefanwalther/) 
* [stefanwalther.io](https://stefanwalther.io)
* [qliksite.io](http://qliksite.io)

### Contributing
Pull requests and stars are always welcome. For bugs and feature requests, [please create an issue](https://github.com/sammlerio/scheduler/issues). The process for contributing is outlined below:

1. Create a fork of the project
2. Work on whatever bug or feature you wish
3. Create a pull request (PR)

I cannot guarantee that I will merge all PRs but I will evaluate them all.

### License
MIT

***

_This file was generated by [verb-generate-readme](https://github.com/verbose/verb-generate-readme), v0.6.0, on October 03, 2018._

