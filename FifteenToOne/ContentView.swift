import SwiftUI

struct ContentView: View {
    @State private var questionManager = QuestionManager()
    @State private var currentQuestion: Question?

    var body: some View {
        if currentQuestion == nil {
            Button("Start")
            {
                Task {
                    try! await questionManager.load()
                    currentQuestion = questionManager.questions.first
                }
            }
        } else {
            VStack {
                Spacer()
                Text(currentQuestion!.question)
                    .font(.headline)
                Spacer()
                Text(currentQuestion!.answer)
                    .foregroundColor(.accentColor)
                    .font(.headline)
                Spacer()
                Button
                {
                    currentQuestion = questionManager.questions.randomElement()
                } label: {
                    Text("Next")
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .clipShape(RoundedRectangle(cornerSize: .init(width: 20, height: 20), style: .continuous))
                .padding()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
