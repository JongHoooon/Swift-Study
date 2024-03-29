# 9. 구조체와 클래스

> Model custom types that encapsulate data.

- 구조체와 클래스는 프로퍼티와 메서드를 사용해 데이터를 묶어 새로운 사용자 정의 데이터 타입을 만들어 준다.
- 구조체의 인스턴스틑 값 타입, 클래스의 인스턴스는 참조 타입 

<br>

## 9.1 구조체

- 구조체는 기본적으로 생성되는 멤버와이즈 이니셜라이저 존재
- 구조체를 let으로 선언하면 인스턴스 내부의 프로퍼티 값 변경할 수 없다.

## 9.2 클래스

- 클래스를 let으로 선언해도 내부 프로퍼티 값을 변경할 수 있다.

## 9.3 구조체와 클래스의 차이

### 같은 점
- 값을 저장하기 위해 프로퍼티를 정의할 수 있다.
- 기능 실행을 위해 메서드를 정희라 수 있다.
- 서브스크립트 문법을 통해 프로퍼티에 접근할 수 있다.
- 이니셜라이저를 정의할 수 있다.
- 익스텐션을 통해 확장할 수 있다.
- 프로토콜을 준수할 수 있다.

### 차이점
- 구조체는 상속할 수 없다.
- 타입캐스팅은 클래스의 인스턴스만 가능
- 디이니셜라이저는 클래스의 인스턴스만 가능
- 참조 횟수 계산은 클래스의 인스턴스에만 적용

<br>

### 값 타입과 참조 타입

- 무엇이 전달되느냐
  - 값 타입: `전달될 값이 복사`되어 전달
  - 참조 타입: `참조(주소)가 전달`된다.

- 클래스의 인스턴스끼리 참조가 같은지 확인할 때 `===(식별 연산자)` 사용

<br>

## 9.4 구조체와 클래스 선택해서 사용하기

### 애플 가이드라인의 구조체 사용 권장하는 경우
>  [Structures and Classes
](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures)

- 연관된 간단한 값의 집합을 캡슐화하는 것만이 목적일 때
- 캡슐화한 값을 참조하는 것보다 복사하는 것이 합당할 때
- `구조체에 저장된 프로퍼티가 값 타입`이며 참조하는 것보다 복사하는 것이 합당할 때
- 다른 타입으로부터 상속받거나 자신을 상속할 필요가 없을 때

