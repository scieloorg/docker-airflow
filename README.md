# Apache Airflow

Docker para o Apache Airflow

[![](https://images.microbadger.com/badges/image/scieloorg/airflow.svg)](https://microbadger.com/images/scieloorg/airflow "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/scieloorg/airflow.svg)](https://microbadger.com/images/scieloorg/airflow "Get your own version badge on microbadger.com")

>Airflow is a platform to programmatically author, schedule and monitor workflows.
>
>Use Airflow to author workflows as Directed Acyclic Graphs (DAGs) of tasks. The Airflow scheduler executes your tasks on an array of workers while following the specified dependencies.
>
>Rich command line utilities make performing complex surgeries on DAGs a snap. The rich user interface makes it easy to visualize pipelines running in production, monitor progress, and troubleshoot issues when needed.
>
>When workflows are defined as code, they become more maintainable, versionable, testable, and collaborative.

![Apache Airflow](https://airflow.readthedocs.io/en/latest/_images/airflow.gif)

## Construção da imagem

```bash
$ docker build --tag airflow:latest ./
```

## Execução

```bash
$ docker run -ti -p 8080:8080 airflow:latest webserver
```

## Referencias
* [Documentação](https://airflow.readthedocs.io/en/latest/)
* [Wiki](https://cwiki.apache.org/confluence/display/AIRFLOW/Airflow+Home)
* [GitHub](https://github.com/apache/airflow)
* [Docker Hub](https://hub.docker.com/r/apache/airflow)
