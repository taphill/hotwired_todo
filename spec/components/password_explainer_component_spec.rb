# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PasswordExplainerComponent, type: :component do
  before do
    render_inline(
      PasswordExplainerComponent.new(
        id: 'password-img-1',
        message: 'Be between 8 to 72 characters long'
      )
    )
  end

  it { expect(rendered_component).to have_css('img[id="password-img-1"]') }
  it { expect(rendered_component).to have_text('Be between 8 to 72 characters long') }
  it { expect(page.find('img')['src']).to have_content('cancel') }
end
