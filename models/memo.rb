# frozen_string_literal: true

require 'json'
require 'securerandom'

class Memo
  attr_accessor :id, :title, :content, :updated_at

  DATA_FILE = 'data/memos.json'

  def initialize(data = {})
    @id = data['id'] || SecureRandom.uuid
    @title = data['title'] || ''
    @content = data['content'] || ''
    @updated_at = data['updated_at'] || Time.now.to_s
  end

  class << self
    def all
      load_data.map { |id, data| new(data.merge('id' => id)) }
    end

    def find(id)
      data = load_data[id]
      return nil unless data

      new(data.merge('id' => id))
    end

    def delete(id)
      data = load_data
      return false unless data.key?(id)

      data.delete(id)
      save_data(data)
      true
    end

    def load_data
      return {} unless File.exist?(DATA_FILE)

      JSON.parse(File.read(DATA_FILE))
    rescue JSON::ParserError
      {}
    end

    def save_data(data)
      File.write(DATA_FILE, data.to_json)
    end
  end

  def to_hash
    {
      'title' => @title,
      'content' => @content,
      'updated_at' => @updated_at
    }
  end

  def save
    data = self.class.load_data
    @updated_at = Time.now.to_s
    data[@id] = to_hash
    self.class.save_data(data)
  end
end
