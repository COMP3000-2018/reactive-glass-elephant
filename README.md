# Reactive Glass Elephant
Development environment and server for CSTR.

Has:
 * Node
 * Flask
 * Postgres (coming soon)


## Hardware Requirements
Ideally the host system should have:
 * 1GB of memory
 * 2GB of storage

## Software Requirements
You need to install
 * Vagrant
 * VirtualBox
 * Sam version Node and NPM
   * In the development server.

## Setup

*guest* refers to the Vagrant virtual machine.

1. Open a regular terminal
2. Change the working directory to the root of this project folder

    ```bash
    host:/$ cd reactive-glass-elephant
    ```

3. Clone projects into the vagrant folder.:

    ```bash
    host:/reactive-glass-elephant$ git clone ... # cstr-client
    host:/reactive-glass-elephant$ git clone ... # cstr-server
    ```
4. Install node modules from *host*.

    There are problems installing node modules from the guest.
    ```bash
    host:/reactive-glass-elephant$ cd cstr-client
    host:/reactive-glass-elephant/cstr-client$ npm install
    ```
5. Start the virtual machine

   Change to the root of the project and type: `vagrant up`
   ```bash
   host:/reactive-glass-elephant$ vagrant up
   ```

6. Install pip packages manually.

   ```bash
   guest:/vagrant/ cd cstr-server
   guest:/vagrant/cstr-server$ . venv/bin/activate
   (venv) guest:/vagrant/cstr-server$ python setup.py install
   (venv) guest:/vagrant/cstr-server$ deactivate
   ```
7. Profit!

    You can access the webserver from your host machine at `localhost:2787`

## Shutting down machine

Open a terminal in host. Change directory into `reactive-glass-elephant`. Type `vagrant halt`

```bash    
host:/reactive-glass-elephant$ vagrant halt
``` 

## Resuming work
When you want to resume work. Change directory into `reactive-glass-elephant`. Type `vagrant up`

1. Open a terminal in host and type `vagrant up`
    ```bash    
    host:/reactive-glass-elephant$ vagrant up
    ```
2. Manually start the front-end development server

    A `.env` file has been added to the root of the project. This makes create-react-app poll for changes and recompile when detected.
    ```bash
    host:/reactive-glass-elephant$ vagrant$ vagrant ssh
    guest:/vagrant/$ cd /vagrant/cstr-client
    guest:/vagrant/$ npm start
    ```
3. Manually start the back-end development server
    
    Open a separate terminal window from the host and start the backend server
    ```bash
    host:/reactive-glass-elephant$ vagrant ssh
    guest:/vagrant/reactive-glass-elephant$ . /vagrant/cstr-server/venv/bin/activate
    guest$ cd /vagrant/cstr-server
    guest:/vagrant/cstr-server$ flask run