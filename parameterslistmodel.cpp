#include "parameterslistmodel.h"

ParametersListModel::ParametersListModel(QObject *parent)
    : QAbstractListModel(parent)
{
    m_values.push_back(0.2);
    m_values.push_back(0.3);
    m_values.push_back(0.4);
    m_values.push_back(0.6);
    m_values.push_back(0.8);

    m_colors.push_back("#999999");
    m_colors.push_back("#888888");
    m_colors.push_back("#777777");
    m_colors.push_back("#666666");
    m_colors.push_back("#555555");
}

int ParametersListModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;

    return m_values.size();
}

QVariant ParametersListModel::data(const QModelIndex &index, int role) const
{
    QVariant result;

    if (!index.isValid())
        return result;

    if (role == ParametersListModel_value)
    {
        result = m_values.at(index.row());
    }
    else if (role == ParametersListModel_valuePrev)
    {
        result = index.row() > 0
                     ? m_values.at(index.row() - 1)
                     : m_values.at(index.row());
    }
    else if (role == ParametersListModel_pieValue)
    {
        double full_summ_value = 0.0;
        for (double value : m_values)
        {
            full_summ_value += value;
        }

        double summ_value = 0.0;
        for (int pieIndex = 0; pieIndex <= index.row(); pieIndex++ )
        {
            summ_value += m_values.at(pieIndex);
        }

        result = summ_value / full_summ_value;
    }
    else if (role == ParametersListModel_piePrev)
    {
        double full_summ_value = 0.0;
        for (double value : m_values)
        {
            full_summ_value += value;
        }

        double summ_value = 0.0;
        for (int pieIndex = 0; pieIndex < index.row(); pieIndex++ )
        {
            summ_value += m_values.at(pieIndex);
        }

        result = summ_value / full_summ_value;
    }
    else if (role == ParametersListModel_color)
    {
        result = m_colors.at(index.row());
    }

    return result;
}

bool ParametersListModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (data(index, role) != value && role == ParametersListModel_value) {
        m_values[index.row()] = value.toDouble();
        emit dataChanged(index, index, {ParametersListModel_value});
        emit dataChanged(createIndex(index.row() + 1,0), createIndex(index.row() + 1,0), {ParametersListModel_valuePrev});
        emit dataChanged(createIndex(0,0), createIndex(m_values.size()-1,0), {ParametersListModel_pieValue});
        emit dataChanged(createIndex(0,0), createIndex(m_values.size()-1,0), {ParametersListModel_piePrev});

        emit maxValueChanged(getMaxValue());

        return true;
    }
    return false;
}

Qt::ItemFlags ParametersListModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return QAbstractItemModel::flags(index) | Qt::ItemIsEditable;
}

QHash<int,QByteArray> ParametersListModel::roleNames() const
{
    QHash<int,QByteArray> roles;
    roles[ParametersListModel_value] = "value";
    roles[ParametersListModel_valuePrev] = "valuePrev";
    roles[ParametersListModel_color] = "pieColor";
    roles[ParametersListModel_pieValue] = "pieValue";
    roles[ParametersListModel_piePrev] = "piePrev";
    return roles;
}

double ParametersListModel::getMaxValue() const
{
    double max_value = 0.0;

    for (const auto& list_value : m_values)
    {
        if (max_value < list_value)
        {
            max_value = list_value;
        }
    }

    return max_value;
}
