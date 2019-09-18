The container will *not* automatically install the node modules found in package.json. If you haven't already done so from the host machine, you can:

1. Start the container.
2. Attach to it from VS Code by right-clicking the container in the sidebar and selecting "Attach Shell".
3. Run the command
    ```
    npm install
    ```

*Please note*: some packages require that they are installed from the target machine directly because they are also compiled automatically, so we recommend following the steps above instead of simply running `npm install` from the host machine.