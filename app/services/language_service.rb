module LanguageService
  def validate_languages
    @subs.select! do |sub| 
      result = valid_language?(sub[:language])
      @invalid_subs << sub if result == false
      
      sub if result == true
    end
  end

  def valid_language?(language)
    return false if language.nil?
    
    fs_languages.include?(language)
  end

  def fs_languages
    %w[
      AR
      CN
      DA
      DE
      EN
      ES
      FR
      HR
      IT
      JA
      KR
      NL
      NO
      PT
      RU
      SV
    ]
  end
end