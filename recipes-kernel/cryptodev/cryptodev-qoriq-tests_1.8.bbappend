RDEPENDS_${PN}_append_qoriq = " bash"
FILESEXTRAPATHS_prepend := "${THISDIR}/sdk_patches:"
FILESEXTRAPATHS_prepend := "${THISDIR}/yocto_patches:"

SRC_URI_append = " \
file://0044-add-aes-256-xts-support-for-async-speed-test.patch \
file://0045-add-support-for-crc32c-hash-async-speed-test.patch \
file://0046-add-support-for-sha1-hash-async-speed-test.patch \
file://0047-add-support-for-sha2-256-hash-async-speed-test.patch \
file://0048-add-support-for-aes-256-xts-sync-speed-test.patch \
file://0049-add-support-for-crc32c-hash-sync-speed-test.patch \
file://0050-add-basic-optargs-support-for-async_speed-test.patch \
file://0051-enable-async-code-by-default.patch \
file://0052-add-flag-to-report-in-a-machine-friendly-format.patch \
file://0053-honor-the-m-flag-in-async_speed.patch \
file://0054-rename-algorithm-names-for-clarity.patch \
file://0055-add-multithreaded-wrapper-for-async-speed-test.patch \
file://0056-fix-set-min-value-when-allocating-alligned-memory-bu.patch \
file://0057-gracefull-stop-for-async-speed-tests.patch \
file://0058-sanity-check-on-dev-crypto-availability.patch \
file://0059-fix-some-issues-with-parsing-mpstat-output.patch \
file://0060-more-precision-in-running-mpstat.patch \
file://0061-add-a-little-space-in-the-output-for-clarity.patch \
file://0062-fix-build-warnings-on-implicit-function-declarations.patch \
file://0063-avoid-implicit-conversion-between-signed-and-unsigne.patch \
file://0064-remove-not-used-local-variables.patch \
file://0065-return-error-code-of-the-test-if-there-is-one.patch \
file://0066-do-more-strict-code-checking-to-avoid-maintenance-is.patch \
file://0067-fix-issues-with-install-target.patch \
file://0068-setting-KERNEL_DIR-is-not-necessary-to-build-tests.patch \
file://0069-fix-the-reported-unit.patch \
file://0070-remove-old-results-to-avoid-incorrect-reports.patch \
file://0071-fix-the-scale-of-the-runtime-value.patch \
file://0072-use-.-instead-of-.-for-consistency.patch \
file://0073-really-fix-again.-the-mpstat-issue.patch \
file://0074-make-default-output-tabular.patch \
file://0075-fix-incorrect-handling-of-error-cases.patch \
file://0076-exit-early-if-cryptodev-tests-are-not-installed.patch \
file://0077-the-C-standard-used-by-cryptodev-is-C90-with-GNU-ext.patch \
file://0078-remove-output-line-because-it-does-not-add-clarity-t.patch \
file://0079-fix-typo-use-consistent-spacing.patch \
file://0080-graceful-exit-if-cryptodev-is-not-built-with-ASYNC-f.patch \
file://0081-add-sync-speed-tests-with-the-same-format-as-async-o.patch \
file://0082-force-LC_TIME-value-to-avoid-mpstat-not-using-ISO860.patch \
file://0083-use-the-same-algorithm-names-in-sync_speed-as-in-asy.patch \
file://0084-fix-ignored-SIGALRM-signals-on-some-platforms.patch \
file://0085-add-notes-about-configured-limits-in-SEC-driver.patch \
file://0086-add-a-wrapper-script-for-running-all-tests.patch \
file://0087-add-to-cpu-idle-for-convenience.patch \
file://0088-merge-sync-and-async-benchmarks-into-a-single-progra.patch \
file://0089-add-async-option-to-run_crypto_tests.sh.patch \
file://0090-Adjust-to-recent-user-page-API-changes.patch \
file://0091-Fix-test-compile-time-warnings.patch \
file://0092-Support-skcipher-in-addition-to-ablkcipher-API.patch \
file://0093-Fix-ablkcipher-algorithms-usage-in-v4.8-kernels.patch \
file://0094-Adjust-to-another-change-in-the-user-page-API.patch \
file://0095-rename-header-file-to-clarify-purpose.patch \
file://0096-use-buf_align-macro-to-reduce-code-duplication.patch \
file://0097-avoid-implicit-conversion-between-signed-and-unsigne.patch \
file://0098-reduce-tests-Makefile-distance-with-upstream.patch \
file://0099-add-support-for-authenc-hmac-sha1-cbc-aes-speed-test.patch \
file://0100-close-the-session-after-every-test.patch \
file://0101-add-support-for-rsa-speed-tests.patch \
file://0102-adjust-to-API-changes-in-kernel-4.10.patch \
file://0103-zc-Use-the-power-of-elif.patch \
file://0104-fix-reset-finish-condition-before-test-start.patch \
"

SRC_URI_append = " file://0003-update-the-install-path-for-cryptodev-tests.patch"
