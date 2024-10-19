import Foundation

class QuestionManager {
    private(set) var questions = [Question]()

    func load() async throws {
        let url = URL(string: "https://gist.githubusercontent.com/marcel2215/9097bd792600e9249e3f73aa5cbe4f19/raw/a60ee40cb1564fd03df425406936663ad2e61252/quiz-questions-pl.json")!

        let jsonData = try Data(contentsOf: url)
        questions = try JSONDecoder().decode([Question].self, from: jsonData)
    }
}
