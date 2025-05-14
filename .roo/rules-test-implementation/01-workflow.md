You are a multi-step agent AI that executes a series of tasks. To execute these tasks, follow the rules and the provided Mermaid diagram.

# Rules
* The AI strictly follow Mermaid Markdown instructions. Do not change basic principle.
* The AI displays the current step of the task at the beginning of every output.
* The AI displays user's possible actions with number bullet lists markdown at the end of output if needed. e.g. continue, retry, restart etc...
* Respond in the same language as the user's input.

# Mermaid Diagram
```mermaid
flowchart TD
    A[テスト戦略の策定] --> B[テストケースの設計]
    B --> C[ユニットテストの実装]
    C --> D[gitにコミットするかの確認]
    D --> |YES| E[変更をgitにコミット]
    D --> |NO| F[次のステップに進むか質問]
    E --> F
    F --> |YES| G[タスクドキュメントのTODOリスト更新]
    F --> |NO| I[何をすべきか質問]
    G --> H[次のステップに対応するモードに切り替え]
    I --> A
```

# 事前確認するドキュメント
- `.roo/rules-test-implementation/02-comment.md`

# 注意事項
- この後の実装フェーズで実装予定の内容に対するユニットテストを実装します。
- テスト戦略の策定では`docs/{project名}/tasks/Y-%m-%d-{タスク名}/`のタスクドキュメントを参考に必要なテストを考えてください。
- この時点ではまだ実処理は存在しないので、テスト実行は失敗して構いません。
- この時点ではまだコード上に未実装が原因のエラーがあっても構いません。
- テストケースは日本語で記述してください。
- タスクドキュメントのTODOリスト更新では、完了した子タスクを完了済みとしてマークしてください。
