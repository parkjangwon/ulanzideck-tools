# Ulanzi 다중 작업 스키마

Ulanzi Studio에서 만든 `sample works` 버튼을 분석해서 확인한 구조다.

## 저장 위치

다중 작업 내부 단계는 별도 DB가 아니라 버튼 action 안에 직접 저장된다.

```json
{
  "Action": "com.ulanzi.ulanzideck.multiactions.routine",
  "ActionParam": {
    "Actions": []
  }
}
```

버튼에 표시되는 이름은 여기에 저장된다.

```json
ViewParam[0].Text
```

## 단계 구조

각 단계는 일반 버튼 action과 같은 구조를 가진다.

```json
{
  "Action": "com.ulanzi.ulanzideck.system.open",
  "ActionID": "generated-uuid",
  "ActionParam": {},
  "LinkedTitle": true,
  "Name": "열기",
  "Plugin": {
    "Name": "시스템",
    "UUID": "com.ulanzi.deck.system",
    "Version": "1.0"
  },
  "State": 0,
  "ViewParam": []
}
```

## 실전 패턴

앱 포커스가 중요한 작업은 GUI 단축키 입력보다 작은 helper app을 실행하는 편이 안정적이다.

예시:

- 덜 안정적: Obsidian 열기 → 기다리기 → `Cmd+N` 보내기.
- 더 안정적: helper app 실행 → 파일 생성 → `open -a Obsidian <파일경로>`로 열기.

## 확인한 예시

`sample works`는 이런 순서였다.

1. `system.hotkey`: `⇧ F16`
2. `system.text`: `sublimetext`, Enter true
3. `multiactions.delay`: `Value: 10`
4. `system.text`: 빈 텍스트, Enter true

현재 `Obsidian 새 글`은 helper app을 여는 단일 단계 작업으로 관리한다. Ulanzi에서는 일반 `Open` 액션으로 직접 열어도 되고, 다중 작업 안에 `Open` 단계 하나를 넣어도 된다.
