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
(define-non-fungible-token loopbombs int)
(define-data-var mint-price uint u5000000000000000)
(define-data-var base-token-uri (buff 50) "https://loopbomb.com/assets/api/v2/loop/1/")

    ;; struct Loopbomb {
    ;;     address author;
    ;;     uint256 date;
    ;; }

    ;; Loopbomb[] public loopbombs;

    ;; function tokenURI(uint256 _tokenId) external view returns (string memory) {
    ;;     return Strings.strConcat(
    ;;         baseTokenURI(),
    ;;         Strings.uint2str(_tokenId)
    ;;     );
    ;; }

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

    ;; function setBaseTokenURI(string memory _uri) public onlyOwner {
    ;;     baseTokenUri = _uri;
    ;; }

    ;; function withdraw() external onlyOwner {
    ;;     msg.sender.transfer(address(this).balance);
    ;; }

    ;; function setMintPrice(uint256 _price) external onlyOwner {
    ;;     mintPrice = _price;
    ;; }

    ;; function getMintPrice() public view returns (uint256) {
    ;;     return mintPrice;
    ;; }

    ;; function baseTokenURI() public view returns (string memory) {
    ;;     return baseTokenUri;
    ;; }

