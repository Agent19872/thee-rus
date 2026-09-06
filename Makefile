# Сборка resource pack из исходников. Никаких commit, push или публикаций.

ZIP_NAME ?= thee-rus-latest.zip
DIST_DIR ?= dist
RP_ARCHIVE := $(DIST_DIR)/$(ZIP_NAME)
RP_INPUTS := assets pack.mcmeta $(wildcard pack.png) $(wildcard LICENSE)

.PHONY: all rp clean

all: rp

# Создать ZIP resource pack из текущих исходников.
# Цель намеренно выполняется всегда: изменения внутри assets/ не меняют
# timestamp самой директории assets/.
rp:
	@mkdir -p "$(DIST_DIR)"
	@rm -f "$(RP_ARCHIVE)"
	@printf 'Собираю %s\n' "$(RP_ARCHIVE)"
	@zip -r -q "$(RP_ARCHIVE)" $(RP_INPUTS)
	@printf 'Готово: %s\n' "$(RP_ARCHIVE)"

# Удалить только локальные результаты сборки.
clean:
	@rm -f "$(RP_ARCHIVE)"
	@printf 'Удалён: %s\n' "$(RP_ARCHIVE)"
