import React, { Component, PropTypes } from 'react';
import Checkbox from './Checkbox';

const propTypes = {
    data: PropTypes.arrayOf(
        PropTypes.shape({
            text: PropTypes.string,
            value: PropTypes.number
        })
    ),
    onChange: PropTypes.func,
    value: PropTypes.array
}

const defaultProps = {
    data: [
        {text: '', value: 0}
    ],
    onChange: (value) => {},
    value: []
}

class CheckboxGroup extends Component {

    constructor(props) {
        super(props);
        this.value = [];
    }

    _checkboxChange(obj) {
        const value = obj.value;
        const checked = obj.checked;
        let checkedList = this.value;
        if (checked) {
            checkedList.push(value);
        } else {
            this.value = checkedList.filter((val) => (val !== value));
        }
        this.props.onChange(this.value);
    }

    _isChecked(value) {
        return (this.value.indexOf(value) > -1);
    }

    render() {
        return (
            <div>
                {this.props.data.map((item) => (
                    <Checkbox
                        key={item.value}
                        text={item.text}
                        value={item.value}
                        checked={this._isChecked(item.value)}
                        onChange={this._checkboxChange.bind(this)}
                    />
                ))}
            </div>
        );
    }
}

CheckboxGroup.propTypes = propTypes;
CheckboxGroup.defaultProps = defaultProps;

export default CheckboxGroup;