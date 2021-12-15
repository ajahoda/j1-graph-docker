FROM node:14-alpine

ENV JUPITERONE_INTEGRATION_DIR=/opt/jupiterone/integration

COPY package.json yarn.lock tsconfig.json LICENSE ${JUPITERONE_INTEGRATION_DIR}/
COPY src/ ${JUPITERONE_INTEGRATION_DIR}/src
COPY scripts/ ${JUPITERONE_INTEGRATION_DIR}/scripts

WORKDIR ${JUPITERONE_INTEGRATION_DIR}
RUN yarn install
RUN chmod +x ./scripts/run.sh

CMD ["./scripts/run.sh"]