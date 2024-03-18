from bootstrap_datepicker_plus.widgets import DatePickerInput
from .models import Room
from django import forms


class CheckInCheckOut(forms.ModelForm):
    class Meta:
        model = Room
        fields = ["check_in", "check_out"]
        widgets = {
            "check_in": DatePickerInput(),
            "check_out": DatePickerInput(
                options={"format": "MM/DD/YYYY"}, range_from="check_in"
            ),
        }
