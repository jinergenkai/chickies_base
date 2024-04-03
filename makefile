
# Set the default shell if using Windows
ifeq ($(OS),Windows_NT)
SHELL := powershell.exe
.SHELLFLAGS := -NoProfile -Command
endif




JSON_DIR := ./lib/data/json/
MODEL_DIR := ./lib/data/model/

JSON_FILES := $(wildcard $(JSON_DIR)*.json)
DART_FILES := $(patsubst $(JSON_DIR)%.json,$(MODEL_DIR)%.dart,$(JSON_FILES))

json_to_model:
	quicktype --lang dart --src ./lib/data/json/account -o ./lib/data/model/account.dart
# $(DART_FILES)
# $(MODEL_DIR)%.dart: $(JSON_DIR)%.json
# 	quicktype --lang dart --src $< -o $@

# Mục tiêu để xóa các file Dart được tạo ra
clean:
	rm -f $(DART_FILES)

talk:
	@echo "Hello! This works."

print_folders:
	@$(MAKE) --no-print-directory list_folders

print:
	Get-childitem -path ./lib/data/json | Select-Object -ExpandProperty Name | Out-File -FilePath ./lib/data/model.txt


json2model:
	Get-childitem -path ./lib/data/json | Select-Object -ExpandProperty Name | Out-File -FilePath ./lib/data/model.txt
	foreach ($$line in Get-Content ./lib/data/model.txt) { quicktype --lang dart --src ./lib/data/json/$$line -o ./lib/data/model/$$line.dart}