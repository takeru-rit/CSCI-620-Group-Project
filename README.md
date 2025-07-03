
# CSCI-620-Group-Project

An analysis of student performance dataset.




## Roadmap

- Connect our analysis directly to the server.

- Add more integrations


## Installation

### Prerequisites

Install [Docker](https://www.docker.com) and [UV](https://docs.astral.sh/uv/). Docker is used to spin up postgres, while UV is used to manage python dependencies.


### Usage

Clone this repo

```bash
  git clone https://github.com/IssacL891/CSCI-620-Group-Project.git
  cd CSCI-620-Group-Project
```

### Generate Synthetic Data

Copy the data from [student-performance](https://www.kaggle.com/datasets/neuralsorcerer/student-performance) into the student-performance folder.

Run 

```bash
  cd "Generate Data"
  uv sync 
  uv venv
```
To generate the virtual env.

Follow the jupyter notebook.

### Setup Postgres server

Run 

```bash
  cd postgres
  docker-compose up -d 
```

To setup the postgres server. More details in the readme in that folder.
