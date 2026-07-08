ACTION_APP_DIR := /Applications/UlanziActions
OBSIDIAN_APP := $(ACTION_APP_DIR)/ObsidianNewNote.app
OBSIDIAN_SOURCE := actions/obsidian-new-note/action.applescript
OBSIDIAN_TEMPLATE := actions/obsidian-new-note/ulanzi-action.template.json
OBSIDIAN_ACTION_JSON := actions/obsidian-new-note/ulanzi-action.json
PROFILE_MANIFEST := $(HOME)/Library/Application Support/Ulanzi/UlanziDeck/ProfilesV2/1e8442c7-8d2e-42bc-aa46-387bb17349b5.ulanziProfile/Profiles/b1de3bc1-9180-4a41-834c-0ae7f62e97f7/manifest.json

.PHONY: help install-obsidian-new-note render-obsidian-action test-obsidian-new-note show-obsidian-button backup-profile

help:
	@echo "Available targets:"
	@echo "  make install-obsidian-new-note  Compile helper app into /Applications/UlanziActions"
	@echo "  make render-obsidian-action     Render Ulanzi JSON snippet for this Mac"
	@echo "  make test-obsidian-new-note     Run the AppleScript source once"
	@echo "  make show-obsidian-button       Show current Ulanzi 0_1 button config"
	@echo "  make backup-profile             Copy current profile manifest with timestamp"

install-obsidian-new-note:
	@mkdir -p "$(ACTION_APP_DIR)"
	@osacompile -o "$(OBSIDIAN_APP)" "$(OBSIDIAN_SOURCE)"
	@echo "Installed: $(OBSIDIAN_APP)"

render-obsidian-action:
	@sed "s#__HOME__#$(HOME)#g" "$(OBSIDIAN_TEMPLATE)" > "$(OBSIDIAN_ACTION_JSON)"
	@echo "Rendered: $(OBSIDIAN_ACTION_JSON)"

test-obsidian-new-note:
	@osascript "$(OBSIDIAN_SOURCE)"

show-obsidian-button:
	@jq '.Controllers[] | select(.Type=="Keypad") | .Actions["0_1"] | {action:.Action, label:.ViewParam[0].Text, path:.ActionParam.Path, steps:.ActionParam.Actions}' "$(PROFILE_MANIFEST)"

backup-profile:
	@cp "$(PROFILE_MANIFEST)" "$(PROFILE_MANIFEST).bak-$$(date +%Y%m%d%H%M%S)"
	@echo "Backed up profile manifest."
