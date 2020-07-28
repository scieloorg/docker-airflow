FROM python:3.7-alpine3.10

ARG UID=1000
ARG GID=1000
ARG UNAME=airflow
ARG GNAME=airflow
ARG AIRFLOW_HOME=/usr/local/airflow
ENV AIRFLOW_GPL_UNIDECODE yes

COPY requirements.txt requirements.txt

RUN apk add --no-cache --virtual .build-deps \
        make gcc g++ musl-dev linux-headers  \
    && apk add bash git openjdk8 postgresql-dev gcc python3-dev musl-dev

RUN pip install --no-cache-dir --upgrade pip \
    && pip install numpy==1.17.0 \
    && pip install -r requirements.txt \
    && apk --purge del .build-deps

RUN addgroup -g ${GID} ${GNAME} \
    && adduser -u ${UID} -G ${GNAME} -S ${UNAME} -h ${AIRFLOW_HOME} \
    && chown -R ${UNAME}:${GNAME} ${AIRFLOW_HOME}

COPY --chown=${UNAME}:${GNAME} ./entrypoint.sh /entrypoint.sh

USER ${UNAME}
WORKDIR ${AIRFLOW_HOME}

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV PATH="$JAVA_HOME/bin:${AIRFLOW_HOME}:${PATH}"

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/dumb-init", "--", "/bin/sh", "/entrypoint.sh"]
CMD ["--help"]