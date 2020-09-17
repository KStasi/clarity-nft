;; ownable
(define-data-var owner principal 'S1G2081040G2081040G2081040G208105NK8PE5)

(define-read-only (get-owner)
    (var-get owner))

(define-read-only (is-owner)
    (ok (is-eq (var-get owner) contract-caller)))

(define-read-only (only-owner)
    (if (is-eq (var-get owner) contract-caller) (ok none) (err 1)))

(define-public (transfer-ownership (new-owner principal))
    (begin 
        (asserts! (is-eq (var-get owner) contract-caller) (err 1))
        (var-set owner new-owner)
        (ok true)))

;; loopbomb
(define-non-fungible-token loopbomb-tokens int)
(define-data-var mint-price uint u5000000000000000)
(define-data-var base-token-uri (buff 100) "https://loopbomb.com/assets/api/v2/loop/1/")
(define-map loopbombs ((author principal)) ((date uint)))

(define-public (update-base-token-uri (new-base-token-uri (buff 100)))
    (begin 
        (asserts! (is-eq (var-get owner) contract-caller) (err 1))
        (var-set base-token-uri new-base-token-uri)
        (ok true)))

(define-public (update-mint-price (new-mint-price uint))
    (begin 
        (asserts! (is-eq (var-get owner) contract-caller) (err 1))
        (var-set mint-price new-mint-price)
        (ok true)))

(define-read-only (get-base-token-uri)
    (var-get base-token-uri))

(define-read-only (get-mint-price)
    (var-get mint-price))

(define-read-only (get-token-uri)
    (var-get base-token-uri))

    ;; // Management methods
    ;; function create() public payable returns (uint) {
    ;;     require(msg.value >= mintPrice, "Not enough ether to mint this token!");

    ;;     if (msg.value > mintPrice) {
    ;;         msg.sender.transfer(msg.value - mintPrice);
    ;;     }

    ;;     uint id = loopbombs.push(Loopbomb(msg.sender, block.timestamp)) - 1;
    ;;     _mint(msg.sender, id);
    ;;     emit LoopbombCreated(id, msg.sender);
    ;;     return id;
    ;; }

    ;; function retrieve(uint256 _id) public view  returns (address, uint256) {
    ;;     return (loopbombs[_id].author, loopbombs[_id].date);
    ;; }

    ;; function withdraw() external onlyOwner {
    ;;     msg.sender.transfer(address(this).balance);
    ;; }



