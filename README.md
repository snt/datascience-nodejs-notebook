# datascience-nodejs-notebook

[Jupyter NodeJS](https://github.com/ebu/jupyter-nodejs) is added into [Jupyter Notebook Data Science Stack](https://github.com/jupyter/docker-stacks/tree/master/datascience-notebook)

# Configuration

## Data Science part

See [Jupyter Notebook Data Science Stack](https://github.com/jupyter/docker-stacks/tree/master/datascience-notebook).

For example

create password:

```
docker run -t -i sntk/datascience-nodejs-notebook ipython -c 'import notebook.auth; notebook.auth.passwd()'
```
this will create `'sha1:xxxxxxx'`.


make notebook directory:

```sh
mkdir /somedir/notebook
```

launch:

```sh
docker run -d -p 8888:8888 -v /somedir/notebooks:/home/jovyan/work sntk/datascience-nodejs-notebook start-notebook.sh --NotebookApp.password='sha1:xxxxxx'
```
Replace
- `/somedir/notebooks` with your actual directory.
- `'sha1:xxxxxx'` with actual hash generated above.


## NodeJS part

For [Jupyter NodeJS](https://github.com/ebu/jupyter-nodejs) part, do following in `/home/jovyan/work`,
or in volume mounted to this to get `package.json` and `node_modules` in it
(We are not going to create `node.js` app here, so answer defaults to `npm init` questions.):

```sh
npm init
```

You can add `npm` modules by

```
npm install package-names
```

Restarting kernel will pick the newly insatalled modules and you can use it in your notebook.
