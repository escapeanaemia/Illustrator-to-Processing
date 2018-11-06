# Illustration-to-Processing(수정중)

이 문서는 어도비 일러스트레이터 파일을 프로세싱으로 불러와서 사용하는 방법을 소개합니다.

**오픈소스로 소스파일을 직접 다운받을 수 있습니다. 혹시라도 문서화 작업에 도움을 주고 싶으면 이슈를 발행해주시면 감사하겠습니다! (ex. PShape에 getVertex 메소드는 ~~한 기능이 있는 것 같습니다.)**


읽는게 귀찮으신 분들을 위해 **3줄 요약**을 했습니다. (맨 아래에 있습니다.)

잘못된 부분은 github 이슈를 남기거나 메일로 보내주시면 감사하겠습니다.

escapeanaemia@gmail.com




## .svg 파일 생성
일러스트에서 생성한 객체들은 벡터 형태로 저장이 됩니다. 따라서 우리는 해당 백터 객체들을 프로세싱으로 불러와서 사용할 수 있습니다. 
<img src="https://github.com/escapeanaemia/Illustration-to-Processing/blob/master/image1.png?raw=true" width="400" height="300">



먼저 일러스트 파일을 저장할 때 ai 파일이 아닌, svg파일로 저장합니다. svg 파일 포멧은 xml 데이터를 저장하고 있어서 해당 데이터를 통해 백터 그래픽을 불러올 수 있습니다. 

svg파일을 프로세싱 프로젝트 폴더 안에 넣습니다. 




## 프로세싱에서 svg파일 파싱
프로세싱에서 svg파일을 불러오기 위해서

[PShape](https://processing.org/reference/PShape.html) 객체를 사용합니다.

```
PShape s;

void setup(){
	s = loadShape("example.svg");
	s.disableStyle();
}
```
위 코드를 보면 PShape 객체 s 를 생성한 후 loadShape 함수를 통해 example.svg 파일을 불러왔습니다. 이제 s는 example.svg파일에 있는 xml 데이터를 가지고 있습니다. 

disableStyle은 가져온 데이터에서 색, 선 등의 스타일을 제거하는 역할을 합니다. 만약 원래 스타일을 유지하고 싶으면 해당 코드를 제거하면 됩니다. 
## PShape의 메소드 사용하기

[Processing reference](https://processing.org/reference/) 페이지를 보면 [PShape](https://processing.org/reference/PShape.html)의 메소드와 역할을 확인할 수 있습니다. 

우리는 아래의 메소드를 사용할 것 입니다.

* getChild()
* getChildCount() 
* shape()



getChildCount()는 Child(자식)의 갯수를 리턴합니다.

getChild는 새로 자식을 불러옵니다. 

getChild(i)는 index 번호 i 에 해당하는 자식을 리턴합니다.

shape()은 가져온 데이터를 프로세싱에서 다시 생성하는 역할을 합니다. 마치 rect이나 ellipse를 이용해 사각형, 원을 그리는 것과 유사합니다. 

인덱스에 대한 이해를 위해 일러스트로 아래와 같은 이미지를 생성하였습니다. 
<img src="https://github.com/escapeanaemia/Illustration-to-Processing/blob/master/image2.png?raw=true" width="400" height="400">


```
<?xml version="1.0" encoding="utf-8"?>
<!-- Generator: Adobe Illustrator 17.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 width="500px" height="500px" viewBox="0 0 500 500" enable-background="new 0 0 500 500" xml:space="preserve">
<rect x="66.252" y="31.457" fill="#231815" stroke="#FFFFFF" stroke-miterlimit="10" width="359.843" height="15.748"/>
<rect x="66.252" y="55.866" fill="#231815" stroke="#FFFFFF" stroke-miterlimit="10" width="359.843" height="15.748"/>
<rect x="66.252" y="80.276" fill="#231815" stroke="#FFFFFF" stroke-miterlimit="10" width="359.843" height="15.748"/>
<rect x="66.252" y="104.685" fill="#231815" stroke="#FFFFFF" stroke-miterlimit="10" width="359.843" height="15.748"/>
<rect x="66.252" y="129.094" fill="#231815" stroke="#FFFFFF" stroke-miterlimit="10" width="359.843" height="15.748"/>
<rect x="66.252" y="153.504" fill="#231815" stroke="#FFFFFF" stroke-miterlimit="10" width="359.843" height="15.748"/>
<rect x="66.252" y="177.913" fill="#231815" stroke="#FFFFFF" stroke-miterlimit="10" width="359.843" height="15.748"/>
<rect x="66.252" y="202.323" fill="#231815" stroke="#FFFFFF" stroke-miterlimit="10" width="359.843" height="15.748"/>
<rect x="66.252" y="226.732" fill="#231815" stroke="#FFFFFF" stroke-miterlimit="10" width="359.843" height="15.748"/>
<rect x="66.252" y="251.142" fill="#231815" stroke="#FFFFFF" stroke-miterlimit="10" width="359.843" height="15.748"/>
<rect x="66.252" y="275.551" fill="#231815" stroke="#FFFFFF" stroke-miterlimit="10" width="359.843" height="15.748"/>
<rect x="66.252" y="299.961" fill="#231815" stroke="#FFFFFF" stroke-miterlimit="10" width="359.843" height="15.748"/>
<rect x="66.252" y="324.37" fill="#231815" stroke="#FFFFFF" stroke-miterlimit="10" width="359.843" height="15.748"/>
<rect x="66.252" y="348.78" fill="#231815" stroke="#FFFFFF" stroke-miterlimit="10" width="359.843" height="15.748"/>
<rect x="66.252" y="373.189" fill="#231815" stroke="#FFFFFF" stroke-miterlimit="10" width="359.843" height="15.748"/>
</svg>


```
위 코드를 보면 
`<rect x="66.252" y="31.457" fill="#231815" stroke="#FFFFFF" stroke-miterlimit="10" width="359.843" height="15.748"/>` 가 첫번째 사각형을 의미합니다. 인덱스 번호는 위에서 코드가 생성된 순서대로 번호가 부여됩니다.


우리는 이러한 원리를 이용하여 아래처럼 코드를 작성할 수 있습니다.

```
PShape s;
void setup() {
  size(500,500);
  background(255);
  s = loadShape("processingParse2.svg");
  s.disableStyle(); //
  /*
  fill(255,0,0);
  for(int i = 0 ; i <s.getChildCount(); i++){
    for(int j = 0; j < s.getChild(i).getVertexCount(); j++){
      println(s.getChild(i).getVertex(j));
    }
  }*/
}

void draw() {
  for(int i = 0 ; i <s.getChildCount(); i++){
    //noFill();
    fill(i*10,i*5,i*3);  
    //stroke(1);
    shape(s.getChild(i),0,0);
  }
}
```
<img src="https://github.com/escapeanaemia/Illustration-to-Processing/blob/master/image3.png?raw=true" width="400" height="400">


실행 결과는 위와 같습니다. 코드를 분석해보면

1. loadShape() 함수를 통해 svg 파일 로드
2. disableStyle() 함수를 통해 svg속 파일속 스타일을(색, 선 속성) 제거합니다. 이때 유의해야할 점은 도형의 정보는 그대로 남아있습니다.
3. draw 함수 안에서 getChildCount가 리턴하는 (일러스트에서 생성된)객체의 갯수 만큼 반복문을 실행합니다. 
4. 색상 값을 i 변수 값에 따라 변경되도록 조절한 후
5. shape()함수에 s.getChild(i) -> i번째 객체를 전달합니다. 


## 3줄 요약
1. 일러스트 파일을 가지고 와서 사용하고 싶다. 단 스타일의 수정은 하고 싶지 않다. => 위 코드에서 "processingParse2.svg" 대신 자신이 사용할 파일명을 입력후 s.disalbeStyle(); 코드 주석(혹은 제거 후) 실행.
2. 일러 파일을 가져오되 스타일도 다시 수정하고 싶다. => 위 코드에서 파일명만 변경.
3. 스타일 수정시 getChild(i)의 인덱스 번호로 shape을 형성하기 이전에 스타일 변경.

## 기타 메소드 정리 (수정중)
기타 PShape에서 사용할 수 있는 여러 메소드와 그 기능을 정리중입니다. 













