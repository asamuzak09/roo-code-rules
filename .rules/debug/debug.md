# 🛠️ デバッグルール

# 修正の指針

以下の点に注意して実装の修正を行ってください。

1. **テストケースの維持と実行の担保**  
   - **既存のテストケースを削除・スキップしたり、必要な処理をコメントアウトするのは禁止します。**
   - すべてのテストケースが正しく実行される状態を保ってください。

2. **原因の特定と根本的な解決**  
   - 修正を行う前に、バグが起きている原因と修正案を複数立てて開発者に提示する

3. **必要なロジックの実装**  
   - 失敗したテストケースに対応するため、必要な処理やエラーチェック、アルゴリズムの改善など、仕様に沿った実装を追加してください。

4. **再テストの実施**  
   - 修正後、全てのテストケースが正常に実行されることを確認するため、再度ユニットテストを実行してください。
