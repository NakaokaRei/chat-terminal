import ArgumentParser
import OpenAISwift

@main
struct Chat: AsyncParsableCommand {

    static var configuration = CommandConfiguration(
        abstract: "You can talk with ChatGPT on Terminal",
        version: "0.1.0"
    )

    @Argument(help: "API Key")
    var key: String

    @Argument(help: "Text to be sent to ChatGPT")
    var prompt: String

    @Option(name: .shortAndLong, help: "Maximum tokens")
    var maxTokens: Int = 100

    func chat() async throws {
        let openAI = OpenAISwift(authToken: key)
        let result = try await openAI.sendCompletion(with: prompt, maxTokens: maxTokens)
        print(result.choices.first?.text ?? "")
    }

    mutating func run() async throws {
        try await chat()
    }
}
