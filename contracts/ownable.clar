(define-data-var owner principal 'S1G2081040G2081040G2081040G208105NK8PE5)

(define-read-only (get-owner)
    (var-get owner))

(define-read-only (is-owner)
    (ok (is-eq (var-get owner) contract-caller)))
    ;; modifier onlyOwner() {
    ;; function isOwner() public view returns (bool) {
    ;; function renounceOwnership() public onlyOwner {
    ;; function transferOwnership(address newOwner) public onlyOwner {
