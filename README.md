# Technical Test Tokopedia
Technical Test Tokopedia, Backend automation testing using Robot Framework.

Requirements : 
------------
1. Python 3.6 or newer
2. [pip](https://pip.readthedocs.org/en/1.1/index.html)
    install pip, follow the instructions [here](https://pip.readthedocs.org/en/1.1/installing.html).
3. Robot Framework 5.0.1
    ```pip install robotframework```
   To make sure that the correct Robot Framework version has been installed, run the following command:
    ```robot --version```
4. Robot Framework - Request Library
    ```pip install robotframework-requests```
5. Robot Framework - pythonlibcore
    ```pip install robotframework-pythonlibcore```

Usage :
------------
1. Clone Repo
    ```https://github.com/bimasakti16/technical_test_tokopedia.git```
2. cd into new directory
    ```cd technical_test_tokopedia```
3. Run test
    ```robot Tests```
4. To see Tests Execution Log, open file log.html from browser
5. To see Tests Report, open file report.html from browser

All API in this testing using dummy API that created from apiary, you can check documentation of this API [here](https://tokopediatest.docs.apiary.io/). There are 3 end points that for this testing : 
1. /processOrder : validation for valid process data
2. /processOrderA : validation for used order id data
3. /processOrderB : validation for empty required parameters data

