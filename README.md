# Roo Code Rules

このリポジトリは、VSCode拡張機能であるRoo Codeのルール（プロンプト）を共通管理するためのリポジトリです。複数のプロジェクトで一貫したAIアシスタントの動作を実現するために、ルールファイルを一元管理し、各プロジェクトに自動同期する仕組みを提供します。

## 開発フロー

タスク設計モードとタスク実行モードを組み合わせた開発フローは以下の通りです：

```mermaid
flowchart TD
    %% タスク設計フェーズ
    A[タスクの設計] --> B{ユーザーが承認}
    B --> |NG| A
    B --> |OK| C[gitブランチの作成]
    C --> D[feature.mdにタスクの機能仕様書を作成]
    D --> E[task.mdにTODOリストを作成]
    E --> F[githubへのPRの作成]
    F --> G[タスク実行モードに切り替え]
    
    %% タスク実行フェーズ
    G --> H[メインTODOリストから１つを選択]
    H --> I[gitブランチを作成]
    I --> J[機能のサブタスクリストを確認]
    J --> K[サブタスクの１つを選択]
    K --> L[サブタスクの内容でnew_taskツールを使用してタスク作成]
    L --> M[サブタスクを実行]
    M --> N{サブタスクが完了したか}
    N --> |NO| O[次のサブタスクを選択]
    O --> L
    N --> |YES| P{サブタスクで設計や実装方針に変更があったか}
    P --> |YES| Q[task.mdの修正]
    P --> |NO| R[完了したサブタスクのTODOを完了済みにマーク]
    Q --> R
    R --> S{選択したメインTODOの全サブタスクが完了したか}
    S --> |NO| K
    S --> |YES| T[PR作成]
    T --> U{他に実施すべきことがあるか質問}
    U --> |YES| A
    U --> |NO| V{次のメインTODOがあるか}
    V --> |YES| H
    V --> |NO| W[完了]
    
    %% スタイリング
    classDef taskDesign fill:#e1f5fe,stroke:#01579b,stroke-width:2px
    classDef taskExecution fill:#f3e5f5,stroke:#4a148c,stroke-width:2px
    classDef decision fill:#fff3e0,stroke:#e65100,stroke-width:2px
    classDef completion fill:#e8f5e8,stroke:#2e7d32,stroke-width:2px
    
    class A,B,C,D,E,F,G taskDesign
    class H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V taskExecution
    class B,N,P,S,U,V decision
    class W completion
```

### フェーズ説明

**タスク設計フェーズ（水色）**
- タスクの要件定義と設計
- ユーザーによる承認プロセス
- 機能仕様書とTODOリストの作成

**タスク実行フェーズ（紫色）**
- TODOリストに基づく段階的な実装
- サブタスクの専門モードへの委譲
- 設計変更の反映とドキュメント更新

**判断ポイント（オレンジ色）**
- ユーザー承認、完了確認、継続判断

**完了（緑色）**
- 全タスクの完了

## 概要

このリポジトリでは、以下のファイルとディレクトリを管理しています：

- `.roomodes` - Rooのカスタムモード定義
- `.roo/` - roo codeのルール定義

## 同期の仕組み

このリポジトリのルールファイルは、GitHub Actionsワークフローを使用して他のリポジトリに自動同期されます。

### 同期プロセス

1. `rules-updated`イベントが発生するか、手動でワークフローがトリガーされる
2. ターゲットリポジトリと`roo-code-rules`リポジトリがチェックアウトされる
3. Makefileを使用してルールファイルとディレクトリがターゲットリポジトリにコピーされる
4. 変更がPRとして作成される

### 同期対象

- `.roomodes`
- `.roo/`

## 使用方法

### 基本的な使用方法

1. エディタを開いたルートディレクトリに以下のファイルとディレクトリを配置します：
   - `.roomodes`
   - `.roo/`
2. Roo Codeを起動すると、配置したルールとカスタムモードが適用されます

### モノレポ運用の場合

1. このリポジトリをクローンします
2. このリポジトリのルートに`projects`ディレクトリを作成します
```
mkdir projects
```
3. 必要なリポジトリを`projects`ディレクトリ内にクローンします
4. Roo Codeを起動すると、配置したルールとカスタムモードが適用されます
