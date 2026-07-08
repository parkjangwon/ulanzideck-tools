# Ulanzi Deck Tools

내가 쓰는 Ulanzi Deck D200 작업과 helper app을 파일로 관리하는 폴더다.

Ulanzi Studio GUI 안에서만 작업을 만들면 다른 맥북으로 옮기거나 수정 이력을 남기기 어렵다. 그래서 실제 동작은 작은 helper app이나 스크립트로 만들고, Ulanzi 버튼은 그 helper app을 실행하게 둔다.

## 현재 액션

- `actions/obsidian-new-note`  
  `~/Documents/Space` Obsidian vault에 `무제.md`, `무제 1.md` 같은 새 노트를 만들고 Obsidian에서 연다.

## 설치

```sh
make install-obsidian-new-note
```

컴파일된 helper app은 여기에 설치된다. Ulanzi가 `~/...` 경로를 그대로 저장하면 실행에 실패할 수 있어서 `/Applications` 아래의 절대경로를 사용한다.

```text
/Applications/UlanziActions/ObsidianNewNote.app
```

Ulanzi Studio에서는 다중 작업이나 일반 `Open` 액션으로 이 앱을 열면 된다.

## 다른 맥북에 세팅

[docs/company-mac-setup.md](docs/company-mac-setup.md)를 보면 된다.

## 원칙

- `.app` 번들은 빌드 결과물이라 repo에 저장하지 않는다.
- 소스 스크립트와 Ulanzi manifest 조각만 이 폴더에 저장한다.
- 앱 포커스가 중요한 작업은 `앱 열기 → 단축키 입력`보다 helper app 실행 방식이 안정적이다.
- 새 작업은 `actions/<작업명>/` 아래에 추가한다.
