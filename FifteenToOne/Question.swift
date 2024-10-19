struct Question: Decodable {
    var question: String
    let answer: String

    enum CodingKeys: String, CodingKey {
        case question = "q"
        case answer = "a"
    }
}
