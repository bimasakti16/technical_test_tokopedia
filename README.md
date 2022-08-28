# Technical Test Tokopedia

Description :
------------
Technical Test Tokopedia, Backend automation testing using Robot Framework. The design pattern used in test automation is keyword-driven testing, Keyword Driven Framework is a functional automation testing framework that divides test cases into four different parts in order to separate coding from test cases and test steps for better automation. Keyword driven testing framework divides the test cases as test steps, objects of test steps, actions on test steps and data for test objects for better understanding.

Pros :
------------
1. Maintenance is low in the long run:
  - Test cases are concise
  - Test cases are readable for the stake holders
  - Test cases are easy to modify
  - New test cases can reuse existing keywords more easily
2. Keyword re-use across multiple test cases
3. Not dependent on a specific tool or programming language
4. Allows to distance tests from the code and helps to make it possible to write them in human-readable language, understood to regular person.
5. It allows functional testers to plan test automation before the application is ready


Cons :
------------
1. Moderately high learning curve initially for non-technical user

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

Need to improve : 
------------
1. Source code management, are required to have good ability in managing source code, because the more test cases, the more keywords will be created
2. Required to be active in finding additional libraries for more complex and detailed test cases