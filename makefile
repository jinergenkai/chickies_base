
# Set the default shell if using Windows
ifeq ($(OS),Windows_NT)
SHELL := powershell.exe
.SHELLFLAGS := -NoProfile -Command
endif

hello:
	@echo "Hello! This works."

#* Json to Model use QuickType
# Define the directories containing the JSON and Dart files
JSON_DIR := ./lib/data/json/
MODEL_DIR := ./lib/data/model/

JSON_FILES := $(wildcard $(JSON_DIR)*)
DART_FILES := $(patsubst $(JSON_DIR)%,$(MODEL_DIR)%.dart,$(JSON_FILES))

print:
	@echo $(JSON_FILES)
	@echo $(DART_FILES)

json_to_model_errrror:
	$(MODEL_FILES): $(JSON_FILES)
		quicktype --lang dart --src $< -o $@

clean_model:
	if (Test-Path ./lib/data/model.txt) { Remove-Item ./lib/data/model.txt }
	Remove-Item ./lib/data/model/*.dart
	Remove-Item ./lib/data/model/*.g.dart

json2model:
	$(MAKE) clean_model 
	Get-childitem -path ./lib/data/json | Select-Object -ExpandProperty Name | Out-File -FilePath ./lib/data/model.txt
	foreach ($$line in Get-Content ./lib/data/model.txt) { quicktype --lang dart --src ./lib/data/json/$$line -o ./lib/data/model/$$line.dart --use-freezed --use-json-annotation --no-null-safety}
	dart run build_runner build
	@echo " *** Json to Model Success *** "

#* Execute the app
run:
	flutter run

#* Build the app

build:
	flutter build apk

#* Clean the build
clean:
	flutter clean