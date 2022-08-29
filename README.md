# Kambok Loan
[![Isues](https://img.shields.io/bitbucket/issues/gitpeters/Kambok%20Loan)](https://github.com/gitpeters/kambokwebloan.git)
[![Github repo size](https://img.shields.io/github/repo-size/gitpeters/kambokwebloan)](https://github.com/gitpeters/kambokwebloan.git)
[![GitHub commit activity](https://img.shields.io/github/commit-activity/w/gitpeters/kambokwebloan)](https://github.com/gitpeters/kambokwebloan.git)
<br>

This project is a subsidiary of [kambok infotech](https://kambok-limited.business.site/) that provides:


* *Programming school*
* *Money Loan services and*
* *Other general services*

## Usage
You can either clone or fork this project
```git
git clone https://github.com/kambok/kambokwebloan.git
git add .
git commit -m"commit text"
git status
git push
```
**Note:** You might come across some errors when pushing your project to git on `Netbeans IDE` like
`Can't connect to any URI: https://github.com/Buroa/Konklex.git` or `(An internal Exception occurred during push: https://github.com/Buroa/Konklex.git: git-receive-pack not permitted)`

### Solution
1. Make sure you `fork` the project
2. Login to your `github` account
3. Go to `settings` scroll down to `Developer settings` 
4. Select `Personal access tokens`
5. Click on `Generate new token`. You might be asked to provide your `login password`
6. Give the token a name by writing into the `Note` input
7. Set your expiration duration
8. Tick `repo`
9. Click on `Generate token`
10. Copy your generated token

**When pushing or pulling your project, you'll be asked to set your credentials** <br>
  `username: ` insert your github username <br>
  `password` paste the copied token

## Deploy project
You'll need to change the database connection password to your own password in the `Database.java` file

## Setting up Environment
- [x] Make sure you have `Java jdk` installed in your computer. If you don't have it, you can download [here](https://javadl.oracle.com/webapps/download/AutoDL?BundleId=246778_424b9da4b48848379167015dcc250d8d) for `Windows` [here](https://download.oracle.com/java/18/latest/jdk-18_macos-aarch64_bin.dmg) for `macOS`
- [x] Create `path` after installing your `java jdk`
  
    ### For Window Users
    * Go to your `file director` `(C:) Local Disk` or the path you installed your `java jdk` > `:Program files` > `:Java` > `:jdk-11.0.12` or any latest version `:bin` *place your cursor pointer at the file url and copy the path directory*
     it should look like this `C:\Program Files\Java\jdk1.8.0_281\bin`
    * Locate your `environment variable` either by searching on your `window search` or right-click on `This PC` > `:Properties` > `:Advanced System Settings` > `Environment variable` then click on `:Path :Edit` and paste your path `C:\Program Files\Java\jdk1.8.0_281\bin` click `Ok`
    * To check if your jdk was successfully installed and path created, open any of your terminal `cmd/git` and type ```java --version```

- [x] Also make sure you install your database. For the project, we're using `MySQL`. If you don't have it installed you can follow this [steps](https://www.sqlshack.com/how-to-install-mysql-database-server-8-0-19-on-windows-10/) for `window users` and [here](https://dev.mysql.com/doc/refman/5.7/en/macos-installation-pkg.html) for `macOS`
  ### For Window Users
    * Create a path called `CLASSPATH` in your `Environment variable` *follow the above steps to locate your environment variable*. Copy and paste your mysql path, it should look like this `C:\Program Files (x86)\MySQL\Connector J 8.0\mysql-connector-java-8.0.21.jar;.;`

## Machines used
This project comprises of main java as the backend

![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=java&logoColor=white)
![Bootstrap](https://img.shields.io/badge/bootstrap-%23563D7C.svg?style=for-the-badge&logo=bootstrap&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)


## Server
![Apache Tomcat](https://img.shields.io/badge/apache%20tomcat-%23F8DC75.svg?style=for-the-badge&logo=apache-tomcat&logoColor=black) `8.0.15.0`

## Integrated Development Environment
![NetBeans IDE](https://img.shields.io/badge/NetBeansIDE-1B6AC6.svg?style=for-the-badge&logo=apache-netbeans-ide&logoColor=white)

## Database
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)

## Contributors
|                                            | GitHup Link                                | Specialization    |
|--------------------------------------------|--------------------------------------------|---------------  |
| [Kambok](https://github.com/kambok)        | https://github.com/kambok                  | Python, Java, Javascript, PHP, Typescript, React, Spring, Springboot, Bootstrap, etc.  |
| [gitpeters](https://github.com/gitpeters)  | https://github.com/gitpeters               | Javascript, Java, Bootstrap, React, Git      |
| [clepbo](https://github.com/clepbo)        | https://github.com/clepbo                  | Java, Boostrap, Javascript     |

## Supported Browser
|                 | Badge                                     |
|----------------|--------------------------------------------|
| Brave          | ![Brave](https://img.shields.io/badge/Brave-FB542B?style=for-the-badge&logo=Brave&logoColor=white)| 
| Firefox        | ![Firefox](https://img.shields.io/badge/Firefox-FF7139?style=for-the-badge&logo=Firefox-Browser&logoColor=white)| 
| Google Chrome  | ![Google Chrome](https://img.shields.io/badge/Google%20Chrome-4285F4?style=for-the-badge&logo=GoogleChrome&logoColor=white)| 






