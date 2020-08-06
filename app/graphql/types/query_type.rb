module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :articles, [Types::ArticleType], null: false
    def articles
      Article.order(id: :asc)
    end

    field :article, Types::ArticleType, null: false do
      argument :id, Int, required: false
    end
    def article(id:)
      Article.find(id)
    end
  end
end
