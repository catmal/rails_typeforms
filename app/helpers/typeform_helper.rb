module TypeformHelper
  def typeform_find(id_or_typeform_uid)
    Typeform.find_by_id(id_or_typeform_uid) || Typeform.find_by_typeform_uid(id_or_typeform_uid)
  end

  def present_typeform(typeform_uid)
    typeform = typeform_find(typeform_uid)
    redirect_to(typeform_view_url(typeform))
  end

  def typeform_original_url(typeform_uid, user)
    typeform = typeform_find(typeform_uid)
    "https://#{RailsTypeforms.config.username}.typeform.com/to/#{typeform.typeform_uid}?uid=#{user.id}&user_id=#{user.id}"
  end

  def embed_typeform(typeform_uid)
    @typeform = typeform_uid
    render partial: "typeforms/embed", object: @typeform
  end
end
