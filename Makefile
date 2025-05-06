# roo-code-rules コピーロジック用Makefile

# デフォルトのターゲットリポジトリパス（環境変数で上書き可能）
TARGET_REPO_PATH ?= ../$(REPO_NAME)

# コピー対象のファイルとディレクトリ
RULE_FILES := .roomodes
RULE_DIRS := .roo/rules .roo/rules-task-design .roo/rules-test-implementation .roo/rules-implementation .roo/rules-debug .roo/rules-create-pr .roo/rules-create-git-repository

# メインターゲット
.PHONY: sync-rules
sync-rules:
	@echo "Syncing roo code rules to $(TARGET_REPO_PATH)..."
	@echo "Removing existing .roo directory..."
	@rm -rf "$(TARGET_REPO_PATH)/.roo"
	@$(MAKE) copy-rule-files
	@$(MAKE) copy-rule-dirs
	@echo "Sync completed successfully!"

# ルールファイルのコピー
.PHONY: copy-rule-files
copy-rule-files:
	@echo "Copying rule files..."
	@for file in $(RULE_FILES); do \
		if [ -f "$$file" ]; then \
			echo "  Copying $$file..."; \
			cp -f "$$file" "$(TARGET_REPO_PATH)/"; \
		else \
			echo "  Warning: $$file not found, skipping..."; \
		fi; \
	done

# ルールディレクトリのコピー
.PHONY: copy-rule-dirs
copy-rule-dirs:
	@echo "Copying rule directories..."
	@for dir in $(RULE_DIRS); do \
		if [ -d "$$dir" ]; then \
			echo "  Copying $$dir/..."; \
			TARGET_DIR="$(TARGET_REPO_PATH)/$$dir"; \
			mkdir -p "$$TARGET_DIR"; \
			cp -rf "$$dir"/* "$$TARGET_DIR/"; \
		else \
			echo "  Warning: $$dir/ not found, skipping..."; \
		fi; \
	done