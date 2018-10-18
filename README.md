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
    host$ cd reactive-glass-elepahnt
    ```

3. Download sub-projects using `git submodule`:

    ```bash
    host$ git submodule init
    host$ git submodule update
    host$ git submodule update --recursive --remote
    ```
4. Install node modules from *host*.

    There are problems installing node modules from the guest.
    ```bash
    host$ cd cstr-client
    host$ npm install
    ```
5. Start the virtual machine

   ```bash
   host$ vagrant up
   ```
6. Manually start the front-end development server

    A `.env` file has been added to the root of the project. This makes create-react-app poll for changes and recompile when detected.
    ```bash
    host$ vagrant ssh
    guest$ cd /vagrant/cstr-client
    guest$ npm start
    ```
7. Manually start the back-end development server
    
    Open a separate terminal window from the host and start the backend server
    ```bash
    host$ vagrant ssh
    guest$ . /vagrant/cstr-server/venv/bin/activate
    guest$ cd /vagrant/cstr-server
    guest$ flask run
    ```

8. Profit!

    You can access the webserver from your host machine at `localhost:2787`
