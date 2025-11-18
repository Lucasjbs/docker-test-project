import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import { connection } from './knex';

dotenv.config();

const app = express();

app.use(cors());
app.use(express.json());

app.get('/', async (_req, res) => {
  try {
    const knquery = connection<any>('test_table').select('*');
    let result = (await knquery);

    res.send(result);
  } catch (error) {
    res.status(500).send({ error: 'Erro ao buscar dados', details: error });
  }
});

export default app;

/*
    I have a backend project written ExpressJS. This project have the following dependencies:
    <list>
    Firtly, give me a short summary about the files I'll need to write (like docker-compose.yml) and give me the links with the documentations for it
    Now, help me write the docker-compose.yml file based on this configurations.

    docker build -t testproject .
    docker-compose up --build -d
*/