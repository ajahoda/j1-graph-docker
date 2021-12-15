## Generalized Dockerfile for JupiterOne graph integrations

### Setup:

####  1. Copy all contents to your graph-myintegration directory

####  2. Copy .env.example to .env, and set environment variables in .env according to the integration being configured

Example for gitlab: [.env.gitlab.example](.env.gitlab.example)

JUPITERONE_ACCOUNT_ID is your unique account ID, and can be found via the following J1QL query:
```
FIND jupiterone_account as a return a._accountId
```

INTEGRATION_INSTANCE_ID can be found in the J1 console under Settings --> Integrations --> Your Integration Instance --> Configuration Settings --> ID

JUPITERONE_API_KEY is your API key, and for the purpose of a custom/local integration can be defined under Settings --> Integrations --> Your Integration Instance --> Integration API Keys

#### 3. Build the image
```
docker build -t myregistry/graph-myintegration .
```

#### 4. Run the container to collect information from the integration and sync it with the JupiterOne platform
e.g.
```
docker run -it --rm --env-file=./.env myregistry/graph-myintegration
```
By default, the container will run the contents of [/scripts/run.sh](/scripts/run.sh), which will run both the collect and sync steps of the integration via `yarn j1-integration run` [documented here](https://github.com/JupiterOne/sdk/blob/main/docs/integrations/development.md#j1-integration-run)