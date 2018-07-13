# README

A simple CI traiing sample application for team memebers.

(in japanese)

## 前提条件

Pull Request (PR) は CI に成功しなければ Merge できないように設定している

Branch protection for master

- [x] Protect this branch

  - [ ] Require pull request reviews before merging
  - [x] Require status checks to pass before merging

    - [x] Require branches to be up to date before merging

  - [ ] Require signed commits
  - [x] Include administrators

## デモ手順

### 1\. テストに成功パターン

テストに成功する branch を作成して CircleCI にてテストが実行されることを確認する。 その結果が Slack に通知されることを確認する。

```
git checkout -b success-branch

echo "Successful edits." >> README.md
git add README.md
git commit -m "Successful commit."

git push origin success-branch
```

### 2\. テスト失敗パターン

テストに失敗する branch を作成して CircleCI にてテストが実行され、 Fail となることを確認する。 その結果が Slack に通知されることを確認する。

```
git checkout -b failed-branch

vi test/controllers/pages_controller_test.rb
```

Code:

```ruby
  test "should get title" do
    get pages_home_url
    assert_select "title", "RailsCiSample-failed"
  end
```

```
git add test/controllers/pages_controller_test.rb

git commit -m "Failed commit."
git push origin failed-branch
```

### 3\. Pull Request への反映確認

1. 上記1の branch を Pull Request したときの結果を確認する

2. 上記2の branch を Pull Request したときの結果を確認する
Successful edits.
