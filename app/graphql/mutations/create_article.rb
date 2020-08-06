module Mutations
  class CreateArticle < BaseMutation
    field :article, Types::ArticleType, null: false

    argument :title, String, required: true
    argument :content, String, required: true

    def resolve(title:, content:)
      article = Article.new(title: title, content: content)
      article.save!
      { article: article }
    end
  end
end
