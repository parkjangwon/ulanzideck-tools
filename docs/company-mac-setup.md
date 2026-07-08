# 회사 맥북 세팅

이 문서는 회사 맥북에 같은 Ulanzi Deck helper 작업을 세팅하는 절차다.

## 1. 폴더 복사

회사 맥북에 이 폴더를 복사한다. 예시:

```sh
mkdir -p ~/dev/project/ulanzi
cp -R ulanzideck-tools ~/dev/project/ulanzi/
```

나중에 GitHub repo로 올리면 `git clone`으로 받으면 된다.

## 2. Obsidian 준비

현재 `obsidian-new-note` 액션은 이 vault 경로를 사용한다.

```text
~/Documents/Space
```

회사 맥북에서도 Obsidian에서 이 vault를 한 번 열어둔다. helper app은 `obsidian://` URL을 쓰지 않고 파일을 만든 뒤 `open -a Obsidian <파일경로>`로 열지만, Obsidian이 해당 폴더를 vault로 인식하려면 한 번은 열어두는 편이 안정적이다.

회사 맥북에서 vault 경로가 다르면 이 파일의 `vaultPath`를 바꾼다.

```text
actions/obsidian-new-note/action.applescript
```

## 3. helper app 설치

repo 루트에서 실행한다.

```sh
make install-obsidian-new-note
```

그러면 이 앱이 생긴다.

```text
/Applications/UlanziActions/ObsidianNewNote.app
```

테스트:

```sh
make test-obsidian-new-note
```

Obsidian vault에 `무제.md`, `무제 1.md` 같은 파일이 생기고 새 노트가 열리면 성공이다.

## 4. Ulanzi Studio에 연결

추천은 GUI에서 직접 연결하는 방식이다.

1. Ulanzi Studio를 연다.
2. D200 키 하나에 `Open` 액션 또는 다중 작업을 추가한다.
3. 실행 대상으로 아래 앱을 고른다.

```text
/Applications/UlanziActions/ObsidianNewNote.app
```

Ulanzi `Open` 액션에 경로를 넣을 때는 `~/...`가 아니라 `/Applications/...` 절대경로로 저장되어야 한다. `~`가 들어가면 Ulanzi가 홈 디렉터리로 확장하지 못해 `!` 오류가 날 수 있다.

맥마다 Ulanzi profile UUID가 달라서 `ProfilesV2/.../manifest.json`을 통째로 복사하는 것보다 GUI로 연결하는 편이 안전하다.

## 5. JSON 참고용

다중 작업 JSON 모양은 여기에서 볼 수 있다.

```text
actions/obsidian-new-note/ulanzi-action.template.json
```

`__HOME__`을 회사 맥북의 홈 경로로 치환하면 manifest 조각으로 쓸 수 있다.

다만 직접 JSON을 패치하는 건 profile UUID와 버튼 위치를 정확히 알고 있을 때만 한다.
