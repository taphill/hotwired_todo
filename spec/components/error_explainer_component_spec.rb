# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ErrorExplainerComponent, type: :component do
  before do
    render_inline(
      ErrorExplainerComponent.new(
        errors: ['something', 'went', 'wrong']
      )
    )
  end

  it { expect(rendered_component).to have_css('div[class="error-explanation"]') }
  it { expect(rendered_component).to have_css('div[data-controller="error"]') }
  it { expect(rendered_component).to have_text('something') }
  it { expect(rendered_component).to have_text('went') }
  it { expect(rendered_component).to have_text('wrong') }
end
