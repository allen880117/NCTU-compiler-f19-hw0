# ===== Please update these fields accordingly

studentName = 王祥任
studentId = 0616309
studentGitHubHandle = allen880117
studentEmail = wangallen880117@gmail.com


# ==============================================
# -- Do not alter ANYTHING after this line -----
# ==============================================

define updateField
	sed -i.sedbak 's/$(1):.*/$(1): $(2)/' $(3)
endef

all: restore
	# Update README.md ...
	$(call updateField,Name,$(studentName), README.md )
	$(call updateField,ID,$(studentId), README.md )
	$(call updateField,GitHub,$(studentGitHubHandle), README.md )
	$(call updateField,Email,$(studentEmail), README.md )
	$(call updateField,Last Make,$(shell date), README.md )
	rm -f README.md.sedbak
	cat README.md | head -n 10

clean: restore

.PHONY: restore
restore: .README.backup.md
	cp .README.backup.md README.md

