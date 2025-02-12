# Schedule Back-end

## 📝 개요

이 프로젝트는 Java, Android를 이용하여 일상생활 속 느꼈던 불편한 점을 해결하기 위한 앱을 개발하는 텀 프로젝트입니다. 특히, 개설된 강의를 통해 가능한 시간표의 경우의 수를 자동으로 계산하는 기능에 중점을 두어, 사용자가 수강할 강의를 선택하면 해당 강의들의 시간표를 겹치지 않게 자동으로 조합하여 제시하는 방식으로 개발하였습니다. 이를 통해 사용자는 여러 시간표 선택지 중에서 가장 적합한 일정을 손쉽게 관리할 수 있습니다.

## 🛠 기술 스택

![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=python&logoColor=white)
![Apache Tomcat](https://img.shields.io/badge/Apache%20Tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

💡 기술적 구현 사항
- 서버 통신 : Servlet을 통한 통신
- 환경 변수 설정 : 코드와 설정을 분리
- 자동 테이블 생성 및 데이터 삽입 : 초기 설정을 위해 서버 실행 시 동작

## 💻 실행 방법

### 1. **설치**

```bash
$ git clone https://github.com/WXXZIN/Schedule-FE.git
```

### 2. **.env 작성**
src/main/resources 경로에 .env 파일 생성

```bash
jdbc.driver=
jdbc.url=
jdbc.username=
jdbc.password=
```

### 3. **Tomcat 설정 및 실행**
Tomcat 9 버전을 사용하여 프로젝트 실행

[Tomcat 다운로드 링크](https://tomcat.apache.org/download-90.cgi)

## 💁‍♂️ 프로젝트 팀원
| Backend | Frontend |
|:---:|:---:|
| <img src="https://github.com/WXXZIN.png" width="100" /> | <img src="https://github.com/Mustache0318.png" width="100" /> |
| [최원진](https://github.com/WXXZIN) | [김지희](https://github.com/Mustache0318) |
